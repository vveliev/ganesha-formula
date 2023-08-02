# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/libs/map.jinja" import mapdata as ganesha with context %}

include:
  - {{ sls_config_clean }}

ganesha-package-clean-pkg-removed:
  pkg.removed:
    - name: {{ ganesha.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
