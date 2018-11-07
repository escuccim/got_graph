# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, get_object_or_404
from .models import Person, Edge, House, RelationshipType
from django.http import JsonResponse, HttpResponse
from django.forms.models import model_to_dict
from django.db.models import Q

# get one person and return them and their relations
def GetPerson(request, pk):
    person = get_object_or_404(Person, pk=pk)
    relations = person.relations()
    house = person.house
    title = person.title.name

    relations_list = []
    for relation in relations:
        relations_dict = {}
        relations_dict['id'] = relation.target.pk
        relations_dict['name'] = relation.target.name
        relations_dict['type'] = relation.relationship.description
        relations_list.append(relations_dict)

    return JsonResponse({'person': model_to_dict(person), 'title': title, 'relations': relations_list, 'house': model_to_dict(house)}, safe=False)

# get the relations for a specified person
# this is actually not currently used, but might be useful
def GetRelations(request, pk):
    person = get_object_or_404(Person, pk=pk)
    relations = person.relations()

    relations_list = []
    for relation in relations:
        relations_dict = {}
        relations_dict['id'] = relation.target.pk
        relations_dict['name'] = relation.target.name
        relations_dict['type'] = relation.relationship.description

        relations_list.append(relations_dict)

    return JsonResponse(relations_list, safe=False)

# display the main page
def Index(request):
    person = Person.objects.filter(pk=1).first()
    houses = House.objects.filter(show_in_legend=1)
    relationships = RelationshipType.objects.filter()

    return render(request, 'graph/index.html', {'person': person, 'relations': person.relations, 'houses': houses, 'relationships': relationships})

# return the entire graph for display
def GetGraph(request):
    edges = Edge.edges_for_display()
    people = Person.get_all()

    return JsonResponse({'edges': list(edges), 'nodes': people})

# return the search results
def SearchTypeAhead(request):
    # get the search term from the get request
    term = request.GET.get('term', '')

    # initialize our response list
    results_list = []

    # if we have a search term filter our objects
    if term != '':
        # search_results = Person.objects.filter(name__icontains=term)
        search_results = Person.objects.filter(
            Q(name__icontains=term) | Q(house__name__icontains=term)
        )

        for item in search_results:
            dict = {
                'id': item.id,
                'label' : item.name + " " + item.house.name,
                'value': item.name + " " + item.house.name,
            }
            results_list.append(dict)

    return JsonResponse(results_list, safe=False)