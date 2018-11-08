var defaultColor = '#efedff';
var activeColor = '#ffffff';
var activeSize = 13;
var defaultSize = 5;
var s;
var fa;

// config for the layout
var config = {
  nodeMargin: 5.0,
  scalingRatio: 1,
  autoStop: true,
  gravity: 3,
  linLogMode: false,
  alignNodeSiblings:  true,
  maxIterations: 250,
  outboundAttractionDistribution: true,
};;

 $( function() {
    // refresh the graph
    $(".refresh_graph").on("click", function(){
        // get data from the API
        data = get_graph();

        // remove the graph and empty the div
        s.kill();
        $("#graph_container").empty();

        // recreate the graph
        s = create_graph(data);

        // redraw the layout
        sigma.layouts.startForceLink(s, config);
    });

    // toggle all relationships on or off
    $(".rel_toggle").on("change", function(){
        checked = $(this). prop("checked");
        $(".rel_filter").prop("checked", checked);
        $(".rel_filter").trigger("change");
    });

    // toggle all houses on or off
    $(".house_toggle").on("change", function(){
        checked = $(this). prop("checked");
        $(".house_filter").prop("checked", checked);
        $(".house_filter").trigger("change");
    });

    // show and removed edges based on checkboxes
    $(".rel_filter").on("change", function(){
        rel_id = $(this).data("val");
        checked = $(this). prop("checked");

        if (rel_id == 6 || rel_id == 7){
            $("#rel_filter_6").prop("checked", checked);
            $("#rel_filter_7").prop("checked", checked);
            if(checked){
                show_edges(6);
            } else {
                hide_edges(6);
            }
            if(checked){
                show_edges(7);
            } else {
                hide_edges(7);
            }
        }

        if(checked){
            show_edges(rel_id);
        } else {
            hide_edges(rel_id);
        }
    });

    // show and removed nodes based on checkbox selected
    $(".house_filter").on("change", function(){
        house_id = $(this).data("val");
        checked = $(this). prop("checked");

        if(checked){
            show_house(house_id);
        } else {
            hide_house(house_id);
        }
    });

    // prevent the form from submitting
    $("#searchForm").on("submit", function (e){
        e.preventDefault;
        return false;
    });

    // get the search results from the API
    $( "#search" ).autocomplete({
      source: function( request, response ) {
            $.ajax( {
              url: search_url,
              dataType: "json",
              data: {
                term: request.term
              },
              success: function( data ) {
                response( data );
              }
            } );
          },
      minLength: 1,
      select: function( event, ui ) {
        load_person(ui.item.id);
        update_node_colors(ui.item.id);
      }
    });

    // capture the click on a related person
    $(document).on("click", ".name_link", function(){
        // get the id from the link
        id = $(this).data("val");

        // make the ajax call to get the data and update the page
        load_person(id);

        // update the node
        update_node_colors(id);
    });
} );

// get the full graph
function get_graph(){
    var data;
    $.ajax({
        async: false,
        url: get_graph_url,
        type: 'get',
        success: function(result){
            data = result;
        },
        error: function(){
            console.log("Error!");
            }
        });
    return data;
}

// makes ajax call for data from API, updates page
function load_person(id){
    $.ajax({
        url: "/get_person/"+id,
        type: 'get',
        success: function(result){
            update_page(result);
        },
        error: function(){
            console.log("Error!");
        }
        });
}

// update page
function update_page(data){
    // update the person's info
    if(data.title != ''){
        full_name = data.title + ' ' + data.person.name + ' ' + data.house.name;
    } else {
        full_name = data.person.name + ' ' + data.house.name;
    }
    $("#name").html(full_name);
    $("#gender").html(data.person.gender);

    if(data.person.alive == 1){
        $("#status").html("Alive");
        $("#age").html(data.person.age);
    } else {
        $("#status").html("Deceased");
        $("#age").html(data.person.age + " (at death)");
    }

    // update the relationships
    new_html = '';
    current_relationship_type = "";
    for(var i=0;i<data.relations.length;i++){
       if(i > 0 && current_relationship_type !=  data.relations[i].type){
            // new_html += "<br />";
       }
       string = '<span class="name-small"><a class="name_link" data-val="' + data.relations[i].id + '">' + data.relations[i].name  + '</a></span> <span class="info">(' + data.relations[i].type + ')</span><br>';
       new_html += string;
       current_relationship_type =  data.relations[i].type
    }
    if(data.relations.length == 0){
        new_html = "None";
    }
    $("#relations").html(new_html);
}

// show all edges
function show_all_edges(){
    var edges = s.graph.edges();

    edges.forEach(function(edge){
        edge.hidden = false;
    });
    s.refresh({ skipIndexation: true });
}

// hide the nodes for a specified house_id
function hide_house(id){
    var nodes = s.graph.nodes();

    nodes.forEach(function(node){
        // if we are hiding a major house use the ID
        if(id != -1){
            if(node.house_id == id){
                node.hidden = true;
            }
         } else {
            if(node.major_house == 0){
                node.hidden = true;
            }
         }
    });
    s.refresh({ skipIndexation: true });
}

// show the nodes for a specified house_id
function show_house(id){
    var nodes = s.graph.nodes();

    nodes.forEach(function(node){
        if(id != -1){
            if(node.house_id == id){
                node.hidden = false;
            }
        } else {
            if(node.major_house == 0){
                node.hidden = false
            }
        }
    });
    s.refresh({ skipIndexation: true });
}

// hide the edges for a specified relationshiptype
function hide_edges(id){
    var edges = s.graph.edges();

    edges.forEach(function(edge){
        if(edge.relationship_type == id){
            edge.hidden = true;
        }
    });
    s.refresh({ skipIndexation: true });
}

// show the edges for a specified relationshiptype
function show_edges(id){
    var edges = s.graph.edges();

    edges.forEach(function(edge){
        if(edge.relationship_type == id){
            edge.hidden = false;
        }
    });
    s.refresh({ skipIndexation: true });
}

// set all nodes back to default color and then change the active node to the active color
function update_node_colors(id){
    var foo = s.graph.nodes();

    foo.forEach(function(node){
        node.color = node.houseColor;
        node.size = defaultSize;
    });
    var n = s.graph.nodes(id);
    n.color = activeColor;
    n.size = activeSize;
    s.refresh({ skipIndexation: true });
}

// load our initial data
data = get_graph();

function create_graph(data){
  s = new sigma({
        graph: data,
        container: document.getElementById('graph_container'),
        settings: {
            defaultNodeType: 'border',
            autoRescale : true,
            defaultEdgeColor: '#004d80',
            edgeColor: 'default',
            labelThreshold: 0,
            activeFontStyle: 'bold',
            nodeActiveLevel: 3,
            level: 1,
            labelAlignment: 'inside',
            labelColor: 'default',
            defaultLabelColor: '#333',
            defaultLabelSize: 14,
            defaultHoverLabelBGColor : 'rgba(255,255,255,.75)',
        },
    });

    // capture te click on a node, and update the display accordingly
    s.bind('clickNode', function(event){
        id = event.data.node.id;
        load_person(id);
        update_node_colors(id);
    });

  return s;
}

// create our sigma graph
s = create_graph(data);

// start our layout
fa = sigma.layouts.startForceLink(s, config);