
{{/*
  raw.resource will create a resource template that can be
  merged with each item in `.Values.resources`.
*/}}
{{- define "raw.common" -}}
metadata:
  {{- if .Values.forceReleaseName }}
  name: {{ $.Release.Name }}
  {{- end }}
  labels: {{- include "common.labels" $ | nindent 4 }}
  annotations: {{- include "common.annotations" $ | nindent 4 }}
{{- end }}