{%- set sample_path = '/share/data/samples' %}
{%- set base_url = 'ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/phase3/data/' %}

{%- for sample_id, sample_files in pillar.get('test_samples',{}).items() %}
{{ sample_path }}/{{ sample_id }}:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
{%- for sample_record in sample_files %}
{%- set file_name = sample_record[0] %}
{%- set md5_sum = sample_record[1] %} 
{{ sample_path }}/{{ sample_id }}/{{ file_name }}:
  file.managed:
    - source: {{ base_url }}/{{ sample_id }}/alignment/{{ file_name }}
    - source_hash: md5={{ md5_sum }}
    - user: root
    - group: root
    - mode: 644
{%- endfor %}
{%- endfor %}
