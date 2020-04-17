rm gateway-keys/server.cert
rm gateway-keys/server.key

kubectl delete peerauthentication ecomm-peer-authn-policy
kubectl delete RequestAuthentication ecomm-req-authn-policy


kubectl delete deployments sts-deployment
kubectl delete deployments orders-deployment
kubectl delete deployments inventory-deployment

kubectl delete service sts-service
kubectl delete service orders-service
kubectl delete service inventory-service

kubectl delete gateway ecomm-gateway -n istio-system

kubectl delete configmap orders-application-properties-config-map
kubectl delete configmap orders-keystore-config-map
kubectl delete configmap orders-keystore-config-map
kubectl delete configmap sts-application-properties-config-map
kubectl delete configmap sts-jwt-keystore-config-map
kubectl delete configmap sts-keystore-config-map

kubectl delete policy ecomm-authn-policy

kubectl delete secret orders-key-credentials
kubectl delete secret sts-keystore-secrets
kubectl delete secret ecomm-credential -n istio-system

kubectl delete ClusterRbacConfig default
kubectl delete ServiceRole order-viewer
kubectl delete ServiceRole order-admin
kubectl delete ServiceRoleBinding order-viewer-binding

kubectl delete destinationrules.networking.istio.io -n istio-system ecomm-authn-istio-gateway-mtls
kubectl delete destinationrules.networking.istio.io ecomm-authn-service-mtls

kubectl delete AuthorizationPolicy orders-services-policy
kubectl delete AuthorizationPolicy ecomm-req-authz-policy
kubectl delete virtualservice ecomm-virtual-service
kubectl delete virtualservice orders-virtual-service
kubectl delete virtualservice sts-virtual-service

istioctl manifest apply --set profile=demo
