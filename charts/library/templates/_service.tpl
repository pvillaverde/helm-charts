{{- define "common.service" -}}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "common.fullname" . }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
  annotations:
    {{- include "common.annotations" . | nindent 4 }}
    {{- with .Values.service.annotations }}
    {{- toYaml . | nindent 4 }}
    {{- end }}
spec:
  type: {{ .Values.service.type }}
  sessionAffinity: {{ .Values.service.sessionAffinity }}
  ports:
    {{- range .Values.service.ports }}
    - port: {{ .port }}
      targetPort: {{ .targetPort }}
      protocol: {{ .protocol }}
      name: {{ .name }}
    {{- end }}
  selector:
    matchLabels:
      {{- include "common.selectorLabels" . | nindent 6 }}
{{- end }}