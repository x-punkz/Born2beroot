Este é um modelo de `README.md` completo para o projeto **Born2beRoot**, estruturado conforme as exigências rigorosas do PDF fornecido, incluindo a parte obrigatória e a seção de bônus.

---

# Born2beRoot

*This project has been created as part of the 42 curriculum by <seu_login>*.

## 📝 Description

Este projeto consiste na criação e configuração de um servidor virtual seguindo regras estritas de administração de sistemas. O objetivo é introduzir conceitos de virtualização, particionamento de disco com LVM, políticas de segurança, gestão de usuários e serviços de rede.

### Escolha do Sistema Operacional: Debian vs Rocky Linux

Para este projeto, foi escolhido o **[Debian/Rocky]**.

* 
**Debian:** Recomendado para iniciantes por sua estabilidade e facilidade de gerenciamento de pacotes (`apt`).


* 
**Rocky Linux:** Uma alternativa empresarial baseada no RHEL, que utiliza `firewalld` e SELinux, oferecendo um ambiente mais complexo.



---

## 🛠️ Instructions

### Instalação e Execução

1. 
**Virtualização:** O uso do VirtualBox (ou UTM) é obrigatório.


2. 
**Configuração de Rede:** O serviço SSH deve rodar na porta **4242**.


3. 
**Assinatura da Máquina:** Para validar o projeto, deve-se gerar o SHA1 do disco virtual (`.vdi` ou `.qcow2`) e colá-lo no arquivo `signature.txt`.


* 
**Comando Linux:** `sha1sum nome_da_maquina.vdi`.





### Regras de Segurança Implementadas

* 
**Firewall:** Ativo no boot, permitindo apenas a porta 4242.


* 
**Sudo:** Configurado com limite de 3 tentativas, mensagens de erro personalizadas e log de todas as ações em `/var/log/sudo/`.


* 
**Política de Senhas:** Expiração a cada 30 dias, mínimo de 10 caracteres (incluindo maiúscula, minúscula e número) e restrições de repetição.



---

## 📊 Monitoring Script

O script `monitoring.sh` (em Bash) exibe a cada 10 minutos via `wall` as seguintes informações:

* Arquitetura do SO e versão do Kernel.


* Processadores físicos e virtuais.


* Uso de memória RAM e disco.


* Carga do CPU e data do último reboot.


* Status do LVM e conexões TCP ativas.


* Endereço IPv4 e MAC.


* Quantidade de comandos executados via `sudo`.



---

## 🌟 Bonus Part

A parte bônus foi implementada após a conclusão perfeita da parte obrigatória.

1. 
**Particionamento Avançado:** Estrutura de partições complexa incluindo `/home`, `/var`, `/srv`, `/tmp` e `/var/log` dentro do LVM.


2. 
**Serviços Web:** Configuração de um site **WordPress** funcional utilizando a stack **Lighttpd, MariaDB e PHP**.


3. 
**Serviço Adicional:** Implementação do serviço **[Nome do seu serviço, ex: Fail2Ban ou FTP]**, escolhido por sua utilidade na segurança/gestão do servidor.



---

## 📚 Resources

* Documentação oficial do Debian/Rocky Linux.


* Man pages: `ufw`, `sudoers`, `crontab`, `lsblk`.
* 
**Uso de IA:** A Inteligência Artificial foi utilizada para **[ex: estruturar este README / explicar a sintaxe do script de monitoramento / comparar AppArmor vs SELinux]**.



Comparações Técnicas 

| Tecnologia | Comparação |
| --- | --- |
| **AppArmor vs SELinux** | O AppArmor (Debian) é baseado em caminhos de arquivos, enquanto o SELinux (Rocky) usa rótulos (labels) de segurança mais granulares e complexos.

 |
| **UFW vs Firewalld** | O UFW é uma interface simplificada para o iptables, enquanto o Firewalld utiliza zonas e é o padrão em sistemas baseados em RHEL.

 |
| **VirtualBox vs UTM** | VirtualBox é o padrão para x86; UTM é a alternativa principal para arquiteturas Apple Silicon (M1/M2).

 |

---

**Gostaria que eu detalhasse a explicação de algum serviço específico (como o WordPress ou o script de monitoramento) para a sua defesa?**