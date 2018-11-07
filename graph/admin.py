# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from .models import Person, RelationshipType, Edge, House

class RelationsInline(admin.TabularInline):
    model = Edge
    fk_name = "source"

class PersonAdmin(admin.ModelAdmin):
    inlines = [
        RelationsInline,
    ]
    search_fields = ['name', 'house__name']
    list_display = ['name', 'house', 'title', 'age', 'gender', 'alive']

class EdgeAdmin(admin.ModelAdmin):
    search_fields = ['source__name', 'target__name', 'description']
    list_display = ['source', 'target', 'relationship']

# Register your models here.
admin.site.register(Person, PersonAdmin)
admin.site.register(Edge, EdgeAdmin)
admin.site.register(RelationshipType)
admin.site.register(House)

