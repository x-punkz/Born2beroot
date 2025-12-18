Aqui está o seu `README.md` atualizado. Ele agora incorpora a estrutura de 7 partições exigida no bônus, detalha a criptografia e respeita todas as exigências do Capítulo VI do PDF (descrição, instruções, recursos e comparações técnicas).

---

# Born2beRoot

*This project has been created as part of the 42 curriculum by <seu_login>*.

## 📝 Description

Este projeto consiste na criação e configuração de um servidor virtual seguindo regras estritas de administração de sistemas. O objetivo é introduzir conceitos de virtualização, particionamento de disco com LVM, criptografia, políticas de segurança e automação via scripts.

### Escolha do Sistema Operacional: Debian vs Rocky Linux

Para este projeto, foi escolhido o **Debian**.

* 
**Debian:** Oferece estabilidade excepcional e um sistema de gerenciamento de pacotes (`apt`) mais amigável para iniciantes.


* 
**Rocky Linux:** Embora robusto para ambientes empresariais, requer configuração complexa de SELinux e não possui suporte oficial para AppArmor nativamente.



---

## 🛠️ Design Choices & Security

### Particionamento e Criptografia (LVM)

Seguindo os requisitos obrigatórios e de bônus, o disco foi estruturado utilizando **LVM (Logical Volume Manager)** sobre uma camada de **Criptografia**.

* 
**Criptografia:** O uso de 2 ou mais partições criptografadas garante que os dados estejam protegidos contra acesso físico não autorizado.


* 
**Estrutura de 7 Partições (Bonus):** O disco foi dividido para otimizar o uso e a segurança, evitando que o preenchimento de uma partição (como logs) derrube o sistema inteiro.


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
**Firewall (UFW):** Apenas a porta **4242** está aberta.


* 
**SSH:** Configurado para acesso apenas em portas não-padrão e com login de `root` desativado.


* 
**Sudo:** Limite de 3 tentativas, mensagens de erro personalizadas e arquivamento completo (input/output) em `/var/log/sudo/`.


* 
**Senha Forte:** Expiração a cada 30 dias, mínimo de 10 caracteres, exigência de letras e números, e limite de repetição de caracteres.



---

## 🚀 Instructions

### Como rodar

1. Baixe o arquivo `signature.txt` do repositório.


2. Verifique a assinatura do seu disco virtual para garantir que coincide com o arquivo entregue:


* Linux: `sha1sum seu_disco.vdi`.


* Windows: `certUtil -hashfile seu_disco.vdi sha1`.




3. Inicie a VM no VirtualBox.


4. O script `monitoring.sh` iniciará automaticamente via `cron` e exibirá informações a cada 10 minutos.



---

## 🌟 Bonus Part

Este projeto inclui a implementação completa dos bônus:

1. 
**Particionamento Avançado:** Uso de volumes lógicos detalhados (7 partições).


2. 
**WordPress:** Site funcional utilizando a stack **Lighttpd, MariaDB e PHP**.


3. 
**Serviço Extra:** Configuração do serviço **[Insira aqui, ex: Fail2Ban]** para reforçar a segurança do servidor.



---

## 📚 Resources & Comparisons

* 
**Recursos:** Manuais do Debian, tutoriais de LVM e documentação oficial do WordPress.


* 
**Uso de IA:** A IA foi utilizada para auxiliar na estruturação deste documento e na lógica do script de monitoramento, sempre validando cada comando manualmente para garantir o aprendizado real.



Comparações Exigidas:

| Comparação | Descrição Breve |
| --- | --- |
| **AppArmor vs SELinux** | AppArmor é baseado em perfis por caminho; SELinux é baseado em rótulos de segurança e políticas mais rígidas.

 |
| **UFW vs Firewalld** | UFW é simplificado (Debian); Firewalld é baseado em zonas dinâmicas (Rocky).

 |
| **VirtualBox vs UTM** | VirtualBox é nativo para sistemas x86; UTM é otimizado para arquitetura Apple Silicon (M1/M2).

 |

---

**Precisa que eu ajude com o código exato do `monitoring.sh` para que ele mostre corretamente as 7 partições no uso de disco?**