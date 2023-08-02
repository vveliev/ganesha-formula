# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/libs/map.jinja" import mapdata as ganesha with context %}

include:
  - {{ sls_config_file }}

ganesha-service-running-service-running:
  service.running:
    - name: {{ ganesha.service.name }}
    - enable: True
    - watch:
      - sls: {{ sls_config_file }}
