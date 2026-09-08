const db = require("../config/db");

class User {
    static async findUserByUsername(username) {
        const snapshot = await db
            .collection("users")
            .where("username", "==", username)
            .get();
        if (snapshot.empty) {
            return null;
        }

        const document = snapshot.docs[0];
        return { id: document.id, ...document.data() };
    }

    static async findUserByEmail(email) {
        const snapshot = await db
            .collection("users")
            .where("email", "==", email)
            .get();
        if (snapshot.empty) {
            return null;
        }

        const document = snapshot.docs[0];
        return { id: document.id, ...document.data() };
    }

    static async createUser(user) {
        return await db.collection("users").add(user);
    }
}

module.exports = User;