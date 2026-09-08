{{/*
Render a templated value within a given context. You have to pass a dict with the value itself and the context
Example: {{- include "common.rendervalue" (dict "value" .Values.valueToRender "context" $ ) }}
*/}}
{{- define "common.rendervalue" -}}
{{- $value := kindIs "string" .value | ternary .value (.value | toYaml) }}
{{- if contains "{{" $value }}
  {{- tpl $value .context }}
{{- else }}
  {{- $value }}
{{- end }}
{{- end }}