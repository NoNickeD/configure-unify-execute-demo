package k8s

deployment: #Deployment & {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name: "nginx-deployment-erroneous"
		labels: app: "nginx"
	}
	spec: {
		replicas: 0
		selector: matchLabels: app: "nginx"
		template: {
			metadata: labels: app: "nginx"
			spec: containers: [{
				name:  "nginx@"
				image: "nginx:latest"
				ports: [{
					containerPort: 0
				}]
				env: [{
					name:  "low_case"
					value: "production"
				}]
			}]
		}
	}
}