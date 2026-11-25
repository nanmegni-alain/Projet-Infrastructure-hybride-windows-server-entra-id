# Exemple de création d'un utilisateur Active Directory.
# À adapter à votre domaine et à votre OU de laboratoire.
# Le mot de passe est demandé de manière sécurisée et n'est pas stocké dans le script.

Import-Module ActiveDirectory

$Prenom = Read-Host "Prénom"
$Nom = Read-Host "Nom"
$Identifiant = Read-Host "Identifiant (sAMAccountName)"
$UPN = Read-Host "UPN (ex. utilisateur@domaine-verifie.tld)"
$CheminOU = Read-Host "Distinguished Name de l'OU cible"

$MotDePasse = Read-Host "Mot de passe temporaire" -AsSecureString

New-ADUser `
    -Name "$Prenom $Nom" `
    -GivenName $Prenom `
    -Surname $Nom `
    -SamAccountName $Identifiant `
    -UserPrincipalName $UPN `
    -Path $CheminOU `
    -AccountPassword $MotDePasse `
    -Enabled $true `
    -ChangePasswordAtLogon $true

Write-Host "Utilisateur créé : $Identifiant"
