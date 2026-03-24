# 🧭 Manual de Instalación de Terraform  
**Curso:** BluePrints / ARSW  
**Objetivo:** Configurar el entorno local para ejecutar y probar Terraform con Azure.

---

## 🧰 1. Requisitos previos

Antes de instalar Terraform asegúrate de tener:
- Cuenta activa en **Azure** (puede ser Azure for Students).  
- Instalado el **Azure CLI** (`az`).  
- Acceso a **Git** y **GitHub**.  
- Conectividad a Internet y permisos de administrador en tu máquina.

---

## 🍎 2. Instalación en macOS

### Opción 1 — vía Homebrew (recomendada)
```bash
brew update
brew install terraform
```

### Verificar instalación
```bash
terraform -version
```

**Ejemplo de salida:**
```
Terraform v1.9.5
on darwin_arm64
```

### Actualizar Terraform
```bash
brew upgrade terraform
```

> 💡 Si usas Mac con chip M1/M2/M3, Homebrew instala automáticamente la versión ARM.

---

## 🐧 3. Instalación en Linux (Ubuntu/Debian)

### Paso 1 — Instalar dependencias
```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
```

### Paso 2 — Agregar el repositorio oficial
```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

### Paso 3 — Instalar Terraform
```bash
sudo apt-get update && sudo apt-get install terraform -y
```

### Verificar instalación
```bash
terraform -version
```

**Salida esperada:**
```
Terraform v1.9.x
```

### Actualizar
```bash
sudo apt-get update && sudo apt-get upgrade terraform -y
```

---

## 🪟 4. Instalación en Windows

### Opción 1 — Con Winget (Windows 10/11)
```powershell
winget install HashiCorp.Terraform
```

### Opción 2 — Manual (ZIP)
1. Descarga el ZIP desde [Terraform Downloads](https://developer.hashicorp.com/terraform/downloads).  
2. Extrae el contenido en `C:\terraform`.  
3. Agrega esa ruta al **PATH** del sistema.  
4. Abre PowerShell y valida:
```powershell
terraform -version
```

> ⚠️ Si el comando no se reconoce, revisa el PATH o reinicia tu sesión.

---

## ☁️ 5. Autenticación con Azure

Conéctate a Azure:
```bash
az login
```
Verifica la suscripción activa:
```bash
az account show
```
Selecciona la correcta (si tienes varias):
```bash
az account set --subscription "<SUBSCRIPTION_ID>"
```

---

## 🧩 6. Inicializar un proyecto Terraform

Dentro de la carpeta `infra/`:
```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan -out plan.tfplan
terraform apply "plan.tfplan"
```

---

## 🧼 7. Desinstalar

**macOS:**  
```bash
brew uninstall terraform
```

**Linux:**  
```bash
sudo apt-get remove terraform -y
```

**Windows:**  
```powershell
winget uninstall HashiCorp.Terraform
```

---

## 🧠 Errores comunes

| Error | Causa | Solución |
|-------|--------|----------|
| `terraform: command not found` | PATH no configurado | Agregar binario al PATH o reinstalar |
| `az login` falla | CLI desactualizado | Ejecuta `az upgrade` |
| `Insufficient privileges` | Sin permisos sobre la suscripción | Solicita rol “Contributor” |
| `Error acquiring state lock` | Backend mal configurado | Verifica contenedor de Azure Storage (tfstate) |

---

## 📘 Referencias oficiales
- [Terraform CLI Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Azure Provider Docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Azure CLI Docs](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
