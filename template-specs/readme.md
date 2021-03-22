# Readme.md

Currently in preview

Use a template spec to share ARM templates with other users in your org.

https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-specs?tabs=azure-cli
If you currently have your templates in a GitHub repo or storage account, you run into several challenges when trying to share and use the templates. For a user to deploy it, the template must either be local or the URL for the template must be publicly accessible. To get around this limitation, you might share copies of the template with users who need to deploy it, or open access to the repo or storage account. When users own local copies of a template, these copies can eventually diverge from the original template. When you make a repo or storage account publicly accessible, you may allow unintended users to access the template.

The benefit of using template specs is that you can create canonical templates and share them with teams in your organization. The template specs are secure because they're available to Azure Resource Manager for deployment, but not accessible to users without Azure RBAC permission. Users only need read access to the template spec to deploy its template, so you can share the template without allowing others to modify it.

The templates you include in a template spec should be verified by administrators in your organization to follow the organization's requirements and guidance.