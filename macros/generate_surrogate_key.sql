{% macro generate_surrogate_key(field_list) %}
    md5({{ field_list | join(" || '-' || ") }})
{% endmacro %}