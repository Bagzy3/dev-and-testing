const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;

app.use(bodyParser.json());

let employees = []; // Base de données temporaire en mémoire

// Créer un employé (POST)
app.post('/api/employees', (req, res) => {
    const { name, position, email } = req.body;
    if (!name || !position || !email) {
        return res.status(400).json({ message: 'Tous les champs sont obligatoires' });
    }

    const newEmployee = { id: employees.length + 1, name, position, email };
    employees.push(newEmployee);

    res.status(201).json({ message: 'Employé ajouté avec succès', employee: newEmployee });
});

// Récupérer tous les employés (GET)
app.get('/api/employees', (req, res) => {
    res.status(200).json(employees);
});

// Récupérer un employé spécifique (GET)
app.get('/api/employees/:id', (req, res) => {
    const employee = employees.find(e => e.id == req.params.id);
    if (!employee) return res.status(404).json({ message: 'Employé non trouvé' });

    res.status(200).json(employee);
});

// Modifier un employé (PUT)
app.put('/api/employees/:id', (req, res) => {
    const employee = employees.find(e => e.id == req.params.id);
    if (!employee) return res.status(404).json({ message: 'Employé non trouvé' });

    const { name, position, email } = req.body;
    if (name) employee.name = name;
    if (position) employee.position = position;
    if (email) employee.email = email;

    res.status(200).json({ message: 'Employé mis à jour', employee });
});

// Supprimer un employé (DELETE)
app.delete('/api/employees/:id', (req, res) => {
    employees = employees.filter(e => e.id != req.params.id);
    res.status(200).json({ message: 'Employé supprimé avec succès' });
});

// Modifier partiellement un employé (PATCH)
app.patch('/api/employees/:id', (req, res) => {
    const employee = employees.find(e => e.id == req.params.id);
    if (!employee) return res.status(404).json({ message: 'Employé non trouvé' });

    // Mettre à jour les propriétés partiellement
    const { name, position, email } = req.body;
    if (name) employee.name = name;
    if (position) employee.position = position;
    if (email) employee.email = email;

    res.status(200).json({ message: 'Employé mis à jour partiellement', employee });
});


// Démarrer le serveur
app.listen(port, () => {
    console.log(`Serveur en écoute sur http://localhost:${port}`);
});
