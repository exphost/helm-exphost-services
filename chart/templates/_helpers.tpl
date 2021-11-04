{{- define "ldap.dc" -}}
dc={{- .Values.domain | replace "." ",dc=" }}
{{- end }}
