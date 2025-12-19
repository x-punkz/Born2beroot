*This project has been created as part of the 42 curriculum by daniviei*.

# Description:

## Born2beRoot
Este projeto consiste na criação e configuração de um servidor virtual seguindo regras estritas
de administração de sistemas. O objetivo é introduzir conceitos de virtualização, particionamento
de disco com LVM, criptografia, políticas de segurança e automação via scripts.

### Escolha do Sistema Operacional: Debian vs Rocky Linux

Para este projeto, foi escolhido o **Debian**.

**Debian:** Recomendado para iniciantes por sua estabilidade e facilidade de gerenciamento de pacotes (`apt`).

 
**Rocky Linux:** Uma alternativa empresarial baseada no RHEL. Embora robusto para ambientes empresariais,
 requer configuração complexa de SELinux e não possui suporte oficial para AppArmor nativamente.

---

## Security

### Particionamento e Criptografia (LVM)

Seguindo os requisitos obrigatórios e de bônus, o disco foi estruturado utilizando 
**LVM (Logical Volume Manager)** sobre uma camada de **Criptografia**.

**Criptografia:** O uso de 7 partições criptografadas garante que os dados estejam protegidos contra
 acesso físico não autorizado.

* 
**Estrutura de 7 Partições (Bonus):** O disco foi dividido para otimizar o uso e a segurança, evitando
que o preenchimento de uma partição (como logs) derrube o sistema inteiro.

* 
`/boot`: Inicialização do sistema (fora do LVM).

* `LVM - root (/)`: Arquivos do sistema operacional.
* `LVM - home`: Dados dos usuários.
* `LVM - swap`: Memória virtual.
* `LVM - var`: Dados variáveis de serviços.
* `LVM - srv`: Dados de serviços específicos.
* `LVM - tmp`: Arquivos temporários.
* `LVM - var/log`: Armazenamento de logs (isolado para segurança).

### Políticas de Segurança
* 
**Firewall (UFW):** Com as portas porta **4242** e **80** abertas.

* 
**SSH:** Configurado para acesso apenas em portas não-padrão (4242) e com login de `root` desativado.

* 
**Sudo:** Limite de 3 tentativas, mensagens de erro personalizadas e arquivamento completo (input/output)
 em `/var/log/sudo/`.

* 
**Senha Forte:** Expiração a cada 30 dias, mínimo de 10 caracteres, exigência de letras e números, e limite de
repetição de caracteres.
    * O limeite de repetiçao de caracteres nao se aplica ao root. 

---

# Instructions:

### Como rodar

1. Baixe o arquivo `signature.txt` do repositório.
* 
2. Verifique a assinatura do seu disco virtual para garantir que coincide com o arquivo entregue:

    * Use `sha1sum seu_disco.vdi`. Para pegar a asssinatura da máquina para fazer a comparação.
* 
3. Inicie uma cópia da VM no VirtualBox.
* 
4. O script `monitoring.sh` iniciará automaticamente via `cron` e exibirá informações a cada 10 minutos.

---

# Bonus Part:

Este projeto inclui a implementação completa dos bônus:

1. **Particionamento Avançado:** Uso de volumes lógicos detalhados (7 partições).

2. **WordPress:** Site funcional utilizando a stack **Lighttpd, MariaDB e PHP**.

3. **Serviço Extra:** Configuração do serviço **Fail2Ban** para reforçar a segurança do servidor.
    Este serviço evita ataque de brute force na porta ssh, banindo o ip atacante depois de um limite de
tentativas.

---

# Resources:

* 
 **Recursos:** Manuais do Debian, tutoriais de LVM e documentação oficial do WordPress.

**Man pages:** `ufw`, `sudoers`, `crontab`, `lsblk`.

**Uso de IA:** A IA foi utilizada apenas para auxiliar na estruturação deste documento.


# Comparations:

| Comparação | Descrição Breve |
| --- | --- |

| | **AppArmor vs SELinux**     
* AppArmor (Debian) é baseado em caminhos de arquivos;
* SELinux (Rocky) é baseado em rótulos (labels) de segurança e políticas mais rígidas.

 |
| **UFW vs Firewalld**
* UFW é simplificado (Debian), que simplifica o iptables ;
* Firewalld (Rocky) é baseado em zonas dinâmicas é o padrão em sistemas baseados em RHEL.

 |
| **VirtualBox vs UTM** 
* VirtualBox é nativo para sistemas x86;
* UTM é é a alternativa principal e otimizada para arquitetura Apple Silicon (M1/M2).

---