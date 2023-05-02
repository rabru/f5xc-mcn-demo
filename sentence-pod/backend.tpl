apiVersion: apps/v1
kind: Deployment
metadata:
  name: sentence-colors
  annotations:
    ves.io/virtual-sites: sentence-backend-vs, sentence-full-vs
spec:
  selector:
    matchLabels:
      app: sentence-colors
  template:
    metadata:
      labels:
        app: sentence-colors
    spec:
      containers:
        - name: colors
          image: registry.gitlab.com/sentence-app/colors:v1
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            - name: PREFIX
              value: "sentence"
            - name: NAMESPACE
              value: "${namespace}"
---
apiVersion: v1
kind: Service
metadata:
  name: sentence-colors
  annotations:
    ves.io/virtual-sites: sentence-backend-vs, sentence-full-vs
spec:
  type: ClusterIP
  selector:
    app: sentence-colors
  ports:
    - name: http
      port: 80
      targetPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sentence-adjectives
  annotations:
    ves.io/virtual-sites: sentence-backend-vs, sentence-full-vs
spec:
  selector:
    matchLabels:
      app: sentence-adjectives
  template:
    metadata:
      labels:
        app: sentence-adjectives
    spec:
      containers:
        - name: adjectives
          image: registry.gitlab.com/sentence-app/adjectives:v1
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            - name: PREFIX
              value: "sentence"
            - name: NAMESPACE
              value: "${namespace}"
---
apiVersion: v1
kind: Service
metadata:
  name: sentence-adjectives
  annotations:
    ves.io/virtual-sites: sentence-backend-vs, sentence-full-vs
spec:
  type: ClusterIP
  selector:
    app: sentence-adjectives
  ports:
    - name: http
      port: 80
      targetPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sentence-animals
  annotations:
    ves.io/virtual-sites: sentence-backend-vs, sentence-full-vs
spec:
  selector:
    matchLabels:
      app: sentence-animals
  template:
    metadata:
      labels:
        app: sentence-animals
    spec:
      containers:
        - name: animals
          image: registry.gitlab.com/sentence-app/animals:v1
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            - name: PREFIX
              value: "sentence"
            - name: NAMESPACE
              value: "${namespace}"
---
apiVersion: v1
kind: Service
metadata:
  name: sentence-animals
  annotations:
    ves.io/virtual-sites: sentence-backend-vs, sentence-full-vs
spec:
  type: ClusterIP
  selector:
    app: sentence-animals
  ports:
    - name: http
      port: 80
      targetPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sentence-locations
  annotations:
    ves.io/virtual-sites: sentence-backend-vs, sentence-full-vs
spec:
  selector:
    matchLabels:
      app: sentence-locations
  template:
    metadata:
      labels:
        app: sentence-locations
    spec:
      containers:
        - name: animals
          image: registry.gitlab.com/sentence-app/locations:v1
          imagePullPolicy: Always
          ports:
            - containerPort: 8080
          env:
            - name: PREFIX
              value: "sentence"
            - name: NAMESPACE
              value: "${namespace}"
---
apiVersion: v1
kind: Service
metadata:
  name: sentence-locations
  annotations:
    ves.io/virtual-sites: sentence-backend-vs, sentence-full-vs
spec:
  type: ClusterIP
  selector:
    app: sentence-locations
  ports:
    - name: http
      port: 80
      targetPort: 8080
---

