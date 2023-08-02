# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/libs/map.jinja" import mapdata as ganesha with context %}
{%- from tplroot ~ "/libs/libtofs.jinja" import files_switch with context %}

include:
  - {{ sls_package_install }}

ganesha-config-file-file-managed:
  file.managed:
    - name: {{ ganesha.config }}
    - source: {{ files_switch(['example.tmpl'],
                              lookup='ganesha-config-file-file-managed'
                 )
              }}
    - mode: 644
    - user: root
    - group: {{ ganesha.rootgroup }}
    - makedirs: True
    - template: jinja
    - require:
      - sls: {{ sls_package_install }}
    - context:
        ganesha: {{ ganesha | json }}
