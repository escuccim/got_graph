# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

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
        return self.name + " " + self.house.name + " (" + self.title.name + ") "

    def __str__(self):
        return self.name + " " + self.house.name + " (" + self.title.name + ") "

    def relations(self):
        relations_set = Edge.objects.filter(source=self.pk).order_by("relationship__order")
        return relations_set


    # get and return all people, with their houses
    @staticmethod
    def get_all():
        all_people = Person.objects.all()

        people_list = []
        for person in all_people:
            house = person.house.name
            color = person.house.color

            dict = {
                'id': person.pk,
                'name': person.name,
                'age': person.age,
                'gender': person.gender,
                'alive': person.alive,
                'house': house,
                'color': color,
                'house_id': person.house.pk,
                'major_house': person.house.major_house,
                'title': person.title.name,
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
            dict = {
                'source_id': edge.source_id,
                'target_id': edge.target_id,
                'relation': edge.relationship.description,
                'weight': edge.relationship.weight,
                'color': edge.relationship.color,
                'relation_id' : edge.relationship.id,
                'display': edge.relationship.display,
            }

            edge_list.append(dict)

        return edge_list

    class Meta:
        pass

