# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/libs/map.jinja" import mapdata as ganesha with context %}

ganesha-package-install-pkg-installed:
  pkg.installed:
    - name: {{ ganesha.pkg.name }}
