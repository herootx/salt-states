remnux-package-wget:
  pkg.installed:
    - name: wget

{% set home = salt['environ.get']('HOME') %}
{% set user = salt['environ.get']('SUDO_USER') %}

{% if home %}
remnux-packages-wget-config:
  file.managed:
    - name: {{ home }}/.wgetrc
    - source: salt://remnux/packages/wget/wgetrc
    - makedirs: False
    - watch:
        - pkg: wget

remnux-packages-wget-ownership:
  file.managed:
    - name: {{ home }}/.wgetrc
    - user: {{ user }}
    - group: {{ user }}
    - watch:
        - file: remnux-packages-wget-config

{% endif %}

