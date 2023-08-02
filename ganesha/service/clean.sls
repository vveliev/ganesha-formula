# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/libs/map.jinja" import mapdata as ganesha with context %}

ganesha-service-clean-service-dead:
  service.dead:
    - name: {{ ganesha.service.name }}
    - enable: False
