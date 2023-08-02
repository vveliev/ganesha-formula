# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/libs/map.jinja" import mapdata as ganesha with context %}

include:
  - {{ sls_service_clean }}

ganesha-subcomponent-config-clean-file-absent:
  file.absent:
    - name: {{ ganesha.subcomponent.config }}
    - watch_in:
        - sls: {{ sls_service_clean }}
