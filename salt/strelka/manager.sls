# Copyright Security Onion Solutions LLC and/or licensed to Security Onion Solutions LLC under one
# or more contributor license agreements. Licensed under the Elastic License 2.0 as shown at
# https://securityonion.net/license; you may not use this file except in compliance with the
# Elastic License 2.0.

{% from 'allowed_states.map.jinja' import allowed_states %}
{% if sls in allowed_states %}

# Strelka config
strelkaconfdir:
  file.directory:
    - name: /opt/so/conf/strelka/rules/compiled/
    - user: 939
    - group: 939
    - makedirs: True

strelkacompileyara:
  file.managed:
    - name: /opt/so/conf/strelka/compile_yara.py
    - source: salt://strelka/compile_yara/compile_yara.py
    - user: 939
    - group: 939
    - makedirs: True

strelkarulesdir:
  file.directory:
    - name: /opt/so/conf/strelka/rules
    - user: 939
    - group: 939
    - makedirs: True

strelkareposdir:
  file.directory:
    - name: /opt/so/conf/strelka/repos
    - user: 939
    - group: 939
    - makedirs: True

{% else %}

{{sls}}_state_not_allowed:
  test.fail_without_changes:
    - name: {{sls}}_state_not_allowed

{% endif %}