apiVersion: apps/v1
kind: Deployment
metadata:
  name: sentence-generator
  annotations:
    ves.io/virtual-sites: sentence-frontend-vs, sentence-full-vs
spec:
  selector:
    matchLabels:
      app: sentence-generator
  template:
    metadata:
      labels:
        app: sentence-generator
    spec:
      containers:
        - name: generator
          image: registry.gitlab.com/sentence-app/generator:dev
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
  name: sentence-generator
  annotations:
    ves.io/virtual-sites: sentence-frontend-vs, sentence-full-vs
spec:
  type: ClusterIP
  selector:
    app: sentence-generator
  ports:
    - name: http
      port: 80
      targetPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sentence-backgrounds
  annotations:
    ves.io/virtual-sites: sentence-frontend-vs, sentence-full-vs
spec:
  selector:
    matchLabels:
      app: sentence-backgrounds
  template:
    metadata:
      labels:
        app: sentence-backgrounds
    spec:
      containers:
        - name: backgrounds
          image: registry.gitlab.com/sentence-app/backgrounds:dev
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
  name: sentence-backgrounds
  annotations:
    ves.io/virtual-sites: sentence-frontend-vs, sentence-full-vs
spec:
  type: ClusterIP
  selector:
    app: sentence-backgrounds
  ports:
    - name: http
      port: 80
      targetPort: 8080
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: sentence-frontend-nginx
  annotations:
    ves.io/virtual-sites: sentence-frontend-vs, sentence-full-vs
spec:
  selector:
    matchLabels:
      app: sentence-frontend-nginx
  template:
    metadata:
      labels:
        app: sentence-frontend-nginx
    spec:
      containers:
        - name: frontend-nginx
          image: registry.gitlab.com/sentence-app/frontend:dev
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
  name: sentence-frontend-nginx
  annotations:
    ves.io/virtual-sites: sentence-frontend-vs, sentence-full-vs
spec:
  type: ClusterIP
  selector:
    app: sentence-frontend-nginx
  ports:
    - name: http
      port: 80
      targetPort: 8080
---

