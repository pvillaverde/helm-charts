{{- define "common.pdb" -}}
{{- if .Values.maxPodsUnavailable -}}
apiVersion: policy/v1
kind: PodDisruptionBudget
metadata:
  name: {{ include "common.fullname" . }}
  labels:
    {{- include "common.labels" . | nindent 4 }}
spec:
  maxUnavailable: {{ .Values.maxPodsUnavailable }}
  selector:
    matchLabels:
      {{- include "common.selectorLabels" . | nindent 6 }}
{{- end }}
{{- end }}