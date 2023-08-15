const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))

const toastList = document.querySelectorAll('.toast')
toastList.forEach(toastElement => {
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastElement)
    toastBootstrap.show()
    
})