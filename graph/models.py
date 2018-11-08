# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from random import randint

class House(models.Model):
    name = models.CharField(max_length=100)
    color = models.CharField(max_length=6)
    show_in_legend = models.IntegerField(default=1)
    major_house = models.IntegerField(default=1, choices=((1, "Yes"), (0, "No")))

    def __unicode__(self):
        return self.name

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['name']

class Title(models.Model):
    name = models.CharField(max_length=100)

    def __unicode__(self):
        return self.name

    def __str__(self):
        return self.name

    class Meta:
        ordering = ['name']

class Person(models.Model):
    name =  models.CharField(max_length=100)
    age = models.IntegerField()
    gender = models.CharField(max_length=1, choices=(("M","M"),("F","F")))
    alive = models.IntegerField(default=1, choices=((1, "Yes"),(0, "No")))
    house = models.ForeignKey(House, default=None, blank=True, on_delete=models.DO_NOTHING)
    title = models.ForeignKey(Title, default=9, blank=True, on_delete=models.DO_NOTHING)
    relations = models.ManyToManyField(
        'Person',
        through='Edge',
        through_fields=('source_id', 'target_id'),
    )

    def __unicode__(self):
        string = self.name + " " + self.house.name
        if self.title.name != " ":
            string += " (" + self.title.name + ") "
        return  string

    def __str__(self):
        string = self.name + " " + self.house.name
        if self.title.name != " ":
            string += " (" + self.title.name + ") "
        return string

    def relations(self):
        relations_set = Edge.objects.filter(source=self.pk).order_by("relationship__order")
        return relations_set


    # get and return all people, with their houses
    @staticmethod
    def get_all():
        all_people = Person.objects.all()
        first_person_id = Person.objects.order_by("id").first().pk

        people_list = []
        for person in all_people:
            # settings to highlight default person
            if person.pk == first_person_id:
                color = '#ffffff'
                x = 10
                y = 10
                size = 13
            # else use default settings
            else:
                color = "#" + person.house.color
                x = randint(1, 50)
                y = randint(1, 50)
                size = 5

            dict = {
                'id': person.pk,
                'label': person.name,
                'age': person.age,
                'gender': person.gender,
                'alive': person.alive,
                'house': person.house.name,
                'color': color,
                'house_color': "#" + person.house.color,
                'house_id': person.house.pk,
                'major_house': person.house.major_house,
                'title': person.title.name,
                'border_color': '#ffffff',
                'labelAlignment': 'inside',
                'border_size': 2,
                'level': 2,
                'hidden': False,
                'x': x,
                'y': y,
                'size': size,
            }

            people_list.append(dict)

        return people_list

    class Meta:
        ordering = ['name']

class RelationshipType(models.Model):
    description = models.CharField(max_length=50)
    order = models.IntegerField(default=10)
    weight = models.IntegerField(default=1)
    color = models.CharField(max_length=6, default="004d80")
    display = models.IntegerField(default=1)

    def __unicode__(self):
        return self.description

    def __str__(self):
        return self.description

    class Meta:
        ordering = ['order']

class Edge(models.Model):
    source = models.ForeignKey(Person, related_name="source", on_delete=models.DO_NOTHING)
    target = models.ForeignKey(Person, related_name="target", on_delete=models.DO_NOTHING)
    relationship = models.ForeignKey(RelationshipType, on_delete=models.DO_NOTHING)

    def __unicode__(self):
        return self.source.name + " - " + self.target.name + " - " + self.relationship.description

    def __str__(self):
        return self.source.name + " - " + self.target.name + " - " + self.relationship.description

    @staticmethod
    def edges_for_display():
        edges = Edge.objects.all()

        edge_list = []
        for edge in edges:
            if edge.relationship.display == 1:
                hidden = False
            else:
                hidden = True

            dict = {
                'id': edge.pk,
                'source': edge.source_id,
                'target': edge.target_id,
                'relation': edge.relationship.description,
                'size': edge.relationship.weight * 2,
                'color': "#" + edge.relationship.color,
                'relationship_type' : edge.relationship.id,
                'hidden': hidden,
            }

            edge_list.append(dict)

        return edge_list

    class Meta:
        pass

