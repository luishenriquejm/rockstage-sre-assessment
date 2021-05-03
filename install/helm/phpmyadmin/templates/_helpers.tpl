{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "phpmyadmin.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "phpmyadmin.labels" -}}
helm.sh/chart: {{ include "phpmyadmin.chart" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/name: phpmyadmin
app.kubernetes.io/managed-by: Helm
app.kubernetes.io/component: primary
{{- end -}}