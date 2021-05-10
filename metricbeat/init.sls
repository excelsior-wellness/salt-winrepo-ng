# Software Definition File for Elasticsearch Metricbeat

# Uses the following associated scripts
# - install.cmd
# - install.ps1
# - remove.cmd

{% set versions = ['7.12.1', '7.12.0', '7.11.2', '7.11.1', '7.11.0', '7.10.2',
                   '7.3.0'] %}

metricbeat:
{% for version in versions %}
  '{{ version }}':
    full_name: 'Metricbeat'
    installer: 'salt://win/repo-ng/salt-winrepo-ng/metricbeat/install.cmd'
    install_flags: {{ version }}
    uninstaller: 'salt://win/repo-ng/salt-winrepo-ng/metricbeat/remove.cmd'
    cache_dir: True
{% endfor %}

metricbeat.yaml:
  file.managed:
    - name: "C:\Program Files\Metricbeat\metricbeat.yml"
    - source: salt://win/repo-ng/salt-winrepo-ng/metricbeat/metricbeat.yml
