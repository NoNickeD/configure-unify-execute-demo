package k8s

#Container: {
    name:  string & =~ "^[a-zA-Z0-9\\-]+$"
    image: string & =~ "^([a-zA-Z0-9\\.]+/)?[a-zA-Z0-9\\-]+:[a-zA-Z0-9\\-\\.]+$"
    ports: [...{ // Make ports required
        containerPort: int & >= 1 & <= 65535
    }]
    env?: [...{
        name:  string & =~ "[A-Z0-9_]+"
        value: string
    }]
}

#Deployment: {
    apiVersion: "apps/v1"
    kind:       "Deployment"
    metadata: {
        name: string
        labels: {
            app: string
        }
    }
    spec: {
        replicas: int & >=1
        selector: {
            matchLabels: {
                app: string
            }
        }
        template: {
            metadata: {
                labels: {
                    app: string
                }
            }
            spec: {
                containers: [#Container, ...#Container]
            }
        }
    }
}
 
