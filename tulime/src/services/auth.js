import{ref} from 'vue'

export function useAuth() {
    const isAuthenticated = ref(false)
    const isAdmin = ref(false)

    async function checkCredentials(credentials) {
        if (!credentials.email || !credentials.password) {
            throw new Error('Email and password are required')
        }

        const userData = localStorage.getItem("user")
        if (!userData) {
            throw new Error('No user found')
        }

        let parsedUser
        try {
            parsedUser = JSON.parse(userData)
        } catch {
            throw new Error('Stored user data is invalid')
        }

        if (
            parsedUser.email !== credentials.email ||
            parsedUser.password !== credentials.password
        ) {
            throw new Error('Invalid email or password')
        }

        isAuthenticated.value = true
        isAdmin.value = parsedUser.role == 1

        localStorage.setItem("isAuthenticated", String(isAuthenticated.value))
        localStorage.setItem("isAdmin", String(isAdmin.value))

        return parsedUser
    }

    async function signup(data) {
        if (!data) {
            throw new Error('User data is required')
        }

        isAuthenticated.value = true
        if (data.role == 1) {
            isAdmin.value = true
        }

        localStorage.setItem("isAuthenticated", String(isAuthenticated.value))
        localStorage.setItem("isAdmin", String(isAdmin.value))
        localStorage.setItem("user", JSON.stringify(data))

        return data
    }

    function logout() {
        localStorage.removeItem("isAuthenticated")
        localStorage.removeItem("isAdmin")
    }

    return {
        checkCredentials,
        signup,
        logout,
    }
 }