
{{/* Init Container to copy from NFS Backup on Bootstrap */}}
{{- define "initContainer" -}}
{{- if .Values.backupJob.enabled }}
- name: init-rsync
  image: alpine:latest
  imagePullPolicy: Always
  volumeMounts:
  - name: data
    mountPath: /data
  - name: backup-data
    mountPath: /backup
  command: [ "/bin/sh", "-c" ]
  args:
  - |
    apk add rsync
    if [ "$FORCE_RSYNC" = "true" ] || [ -z "$(ls -A /data)" ]; then
      cd  /backup
      rsync -avz . /data/ --progress --delete
    fi
  env:
  - name: FORCE_RSYNC
    value: {{ .Values.backupJob.forceInitRsync | quote }}
  resources:
    requests:
      memory: "128Mi"
      cpu: "100m"
    limits:
      memory: "128Mi"
      cpu: "1"
  securityContext:
    allowPrivilegeEscalation: false
    readOnlyRootFilesystem: false
    capabilities:
      drop: [ "all" ]
{{- end }}
{{- end }}

{{- define "common.extraContainers" -}}
{{- with .Values.extraContainers }}
{{ toYaml . }}
{{- end }}
{{- end }}
