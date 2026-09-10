{{- define "common.serviceaccount" -}}
{{- if and .Values.serviceAccount .Values.serviceAccount.create -}}
apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{ include "common.ServiceAccountName" . }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
  annotations:
    {{- include "common.annotations" . | nindent 4 }}
    {{- with .Values.serviceAccount.annotations }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
{{- end }}
{{- end }}