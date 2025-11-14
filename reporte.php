<?php
require_once("clases/conexion.php");
$con = new Conexion();
$pdo = $con->pdo;

$stmt = $pdo->query("SELECT * FROM inscriptores ORDER BY fecha_formulario DESC");
$lista = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Reporte de Inscriptores</title>
<link rel="stylesheet" href="css/estilo.css">

<style>
table {
    width: 95%;
    margin: 20px auto;
    border-collapse: collapse;
    background: #1a2e52;
    color: white;
}
th, td {
    border: 1px solid #3d5c8a;
    padding: 10px;
    text-align: left;
}
th {
    background: #4d8dff;
}
tbody tr:hover {
    background: rgba(255,255,255,0.1);
}
</style>

</head>
<body>

<div class="container">
    <h2>Reporte de Inscriptores</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Nombre Completo</th>
            <th>Sexo</th>
            <th>Correo</th>
            <th>País</th>
            <th>Intereses</th>
            <th>Observaciones</th>
            <th>Fecha</th>
        </tr>

        <?php foreach ($lista as $row): ?>
        <tr>
            <td><?= $row['id'] ?></td>
            <td><?= $row['nombre'] . " " . $row['apellido'] ?></td>
            <td><?= $row['sexo'] ?></td>
            <td><?= $row['correo'] ?></td>
            <td><?= $row['pais_residencia'] ?></td>
            <td>
                <?php 
                    $ints = json_decode($row['intereses'], true);
                    echo implode(", ", $ints);
                ?>
            </td>
            <td><?= $row['observaciones'] ?></td>
            <td><?= $row['fecha_formulario'] ?></td>
        </tr>
        <?php endforeach; ?>
    </table>
</div>

</body>
</html>
