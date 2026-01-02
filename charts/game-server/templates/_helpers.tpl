{{- define "custom.extraVolumes" -}}
{{- with .Values.extraVolumes }}
{{ toYaml . }}
{{- end }}
{{- end }}
