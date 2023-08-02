# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/libs/map.jinja" import mapdata as ganesha with context %}
{%- from tplroot ~ "/libs/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_config_file }}

ganesha-subcomponent-config-file-file-managed:
  file.managed:
    - name: {{ ganesha.subcomponent.config }}
    - source: {{ files_switch(['subcomponent-example.tmpl'],
                              lookup='ganesha-subcomponent-config-file-file-managed',
                              use_subpath=True
                 )
              }}
    - mode: "0644"
    - user: root
    - group: {{ ganesha.rootgroup }}
    - makedirs: True
    - template: jinja
    - require_in:
      - sls: {{ sls_config_file }}
