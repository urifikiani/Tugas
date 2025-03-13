require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const client = require('./connection');
const app = express();
const cors = require('cors')
const path = require('path')
app.use(express.static(path.join(__dirname, 'views')));

app.use(bodyParser.json());
app.use(cors())

app.listen(3100, () => {
    console.log('Server running on port 3100');
});

client.connect(err => {
    if (err) {
        console.log(err.message);
    } else {
        console.log('Connected to the database');
    }
});

app.get('/admin', (req, res) => {
    client.query("SELECT * FROM admin", (err, results) => {
        if (err) res.send(err.message);
        else res.send(results.rows);
    });
});

app.get('/admin/:admin_id', (req, res) => {
    const { admin_id } = req.params;
    client.query(`SELECT admin_id, name, email, password FROM admin WHERE admin_id = $1`, [admin_id], (err, results) => {
        if (err) res.send(err.message);
        else res.send(results.rows);
    });
});

app.post('/admin', (req, res) => {
    const { name, email, password } = req.body;
    client.query(
        `INSERT INTO admin (name, email, password) VALUES ($1, $2, $3)`,
        [name, email, password],
        (err) => {
            if (err) res.send(err.message);
            else res.send('Insert Success');
        }
    );
});

app.put('/admin/:admin_id', (req, res) => {
    const { admin_id } = req.params;
    const { name, email, password } = req.body;
    client.query(
        `UPDATE admin SET name = $1, email = $2, password = $3 WHERE admin_id = $4`,
        [name, email, password, admin_id],
        (err) => {
            if (err) res.send(err.message);
            else res.send('Update Success');
        }
    );
});

app.delete('/admin/:admin_id', async (req, res) => {
    const { admin_id } = req.params;

    try {
        // Hapus data admin berdasarkan ID
        await client.query(`DELETE FROM admin WHERE admin_id = $1`, [admin_id]);

        // Cek apakah tabel masih ada datanya
        const checkData = await client.query(`SELECT COUNT(*) FROM admin`);
        const totalData = parseInt(checkData.rows[0].count, 10);

        if (totalData === 0) {
            // Jika tabel kosong, reset sequence ke 1
            await client.query(`ALTER SEQUENCE admin_admin_id_seq RESTART WITH 1`);
        } else {
            // Jika masih ada data, set sequence ke MAX(admin_id)
            await client.query(`SELECT setval('admin_admin_id_seq', (SELECT MAX(admin_id) FROM admin))`);
        }

        res.send('Delete Success & ID Reordered');
    } catch (error) {
        res.send('Delete Success but failed to reorder ID: ' + error.message);
    }
});

// app.delete('/admin/:admin_id', (req, res) => {
//     const { admin_id } = req.params;
//     client.query(`DELETE FROM admin WHERE admin_id = $1`, [admin_id], (err) => {
//         if (err) res.send(err.message);
//         else res.send('Delete Success');
//     });
// });
