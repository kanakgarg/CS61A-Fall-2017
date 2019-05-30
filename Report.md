## k8s  
foobar  
|Severity        |Policy                   |Rule                  | ID                      | Enabled |
|----------------|-------------------------|----------------------|-------------------------|---------|
| high | ``do not run containers as root``  | ``$.spec.template.spec.securityContext.runAsUser < 1``  | 314eba46-a376-43f6-9a0a-8517818301f1 | True |  
  
  
  
| medium | ``do not run containers with dangerous capabilities``  | ``$.spec.template.spec.containers[*].securityContext.capabilities.add contains FSETID or $.spec.template.spec.containers[*].securityContext.capabilities.add contains SETUID or $.spec.template.spec.containers[*].securityContext.capabilities.add contains SETGID or $.spec.template.spec.containers[*].securityContext.capabilities.add contains SYS_CHROOT or $.spec.template.spec.containers[*].securityContext.capabilities.add contains SYS_PTRACE or $.spec.template.spec.containers[*].securityContext.capabilities.add contains CHOWN or $.spec.template.spec.containers[*].securityContext.capabilities.add contains NET_RAW or $.spec.template.spec.containers[*].securityContext.capabilities.add contains NET_ADMIN or $.spec.template.spec.containers[*].securityContext.capabilities.add contains SYS_ADMIN or $.spec.template.spec.containers[*].securityContext.capabilities.add contains NET_BIND_SERVICE ``  | 135420a6-3206-4c29-b944-846f65cea43e | True |  
  
  
  
| high | ``'all' capabilities should be dropped``  | ``$.spec.template.spec.containers[*].securityContext.capabilities.drop exists and !contains all``  | 4682a6f1-2a1b-4f5a-938c-cdd3fa421a63 | True |  
  
  
  
| high | ``avoid running privileged containers ``  | ``$.spec.template.spec.containers[*].securityContext.privileged == true``  | 92714c07-d12b-4635-ae6a-514c5c428c5a | True |  
  
  
  
| medium | ``ensure containers are immutable ``  | ``$.spec.template.spec.containers[*].securityContext.readOnlyRootFilesystem exists and  is false``  | c448b01c-7f95-4e9f-97e1-c640733af44f | True |  
  
  
  
| medium | ``do not allow sharing host IPC namespace``  | ``$.spec.template.spec.hostIPC is true``  | 344fb01c-7195-3e9f-47e1-c640733af43f | True |  
  
  
  
| medium | ``do not allow sharing host PID namespace``  | ``$.spec.template.spec.hostPID is true``  | 4c5d00c1-8f60-40bc-9566-a5b4e019752a | True |  
  
  
  
| high | ``containers must be run as non-root``  | ``$.spec.template.spec.containers[*].securityContext.runAsNonRoot exists and is false``  | 2e22737c-a5b8-4808-8a8b-d99fc7e99505 | True |  
  
  
  
| medium | ``entrypoint of the container must be run with a user with a high ID``  | ``$.spec.template.spec.containers[*].securityContext.runAsUser < 9999``  | 6e06b1a6-7eea-4730-91c2-9ac3fb676dce | True |  
  
  
  
| medium | ``do not allow volume claims to be read-write by many nodes``  | ``$.spec.volumeClaimTemplates[*].spec.accessModes == ReadWriteMany``  | 802f2ed9-0b0d-4627-bf1a-7cb0ccfdd71c | True |  
  
  
  
| low | ``do not allow volume claims to be read by many nodes``  | ``$.spec.volumeClaimTemplates[*].spec.accessModes == ReadOnlyMany``  | 802f2ed9-0b0d-4627-bf1a-7cb0ccfdd71c | True |  
  
  
  
| high | ``do not share host network with containers``  | ``$.spec.template.spec.hostNetwork == true``  | 99544e17-fc8f-4c77-963e-083ab80c53b0  | True |  
  
  
  
