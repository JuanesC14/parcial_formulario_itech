<?php
require_once("clases/conexion.php");
$con = new Conexion();
$pdo = $con->pdo;

$mensaje = "";

// cargar países
$stmt = $pdo->query("SELECT name FROM countries ORDER BY name ASC");
$paises = $stmt->fetchAll(PDO::FETCH_ASSOC);

// cargar áreas de interés
$stmt = $pdo->query("SELECT name FROM areas_interes ORDER BY name ASC");
$intereses_lista = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER["REQUEST_METHOD"] === "POST") {

    $nombre = ucfirst(strtolower($_POST['nombre']));
    $apellido = ucfirst(strtolower($_POST['apellido']));
    $correo = $_POST['correo'];
    $celular = $_POST['telefono'];
    $sexo = $_POST['genero']; // viene male/female/other ya
    $pais = $_POST['pais'];
    $nacionalidad = $_POST['nacionalidad'];
    $observaciones = $_POST['observaciones'];

    // intereses en JSON
    $intereses = isset($_POST['temas']) ? json_encode($_POST['temas'], JSON_UNESCAPED_UNICODE) : json_encode([]);

    $sql = "INSERT INTO inscriptores 
    (nombre, apellido, edad, sexo, pais_residencia, nacionalidad, correo, celular, intereses, observaciones)
    VALUES 
    (:nombre, :apellido, NULL, :sexo, :pais, :nacionalidad, :correo, :celular, :intereses, :obs)";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':nombre' => $nombre,
        ':apellido' => $apellido,
        ':sexo' => $sexo,
        ':pais' => $pais,
        ':nacionalidad' => $nacionalidad,
        ':correo' => $correo,
        ':celular' => $celular,
        ':intereses' => $intereses,
        ':obs' => $observaciones
    ]);

    $mensaje = "Datos guardados exitosamente";
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario iTECH</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>

<body>

<div class="container">
    <h2>Formulario de Inscripción</h2>

    <?php if ($mensaje): ?>
        <p class="exito"><?= $mensaje ?></p>
    <?php endif; ?>

    <form method="POST">

        <div class="fila-horizontal">
            <div class="grupo">
                <label>Nombre</label>
                <input type="text" name="nombre" required>
            </div>

            <div class="grupo">
                <label>Apellido</label>
                <input type="text" name="apellido" required>
            </div>

            <div class="grupo">
                <label>Sexo</label>
                <select name="genero" required>
                    <option value="">Seleccione...</option>
                    <option value="male">Hombre</option>
                    <option value="female">Mujer</option>
                    <option value="other">Otro</option>
                </select>
            </div>
        </div>

        <div class="fila-horizontal">
            <div class="grupo">
                <label>Correo</label>
                <input type="email" name="correo" required>
            </div>

            <div class="grupo">
                <label>Celular</label>
                <input type="text" name="telefono" required>
            </div>
        </div>

        <div class="fila-horizontal">
            <div class="grupo">
                <label>País de Residencia</label>
                <select name="pais" required>
                    <option value="">Seleccione...</option>
                    <?php foreach ($paises as $p): ?>
                        <option value="<?= $p['name'] ?>"><?= $p['name'] ?></option>
                    <?php endforeach; ?>
                </select>
            </div>

            <div class="grupo">
                <label>Nacionalidad</label>
                <input type="text" name="nacionalidad" required>
            </div>
        </div>

        <div class="grupo checklist-box">
            <label>Temas que le gustaría aprender</label>
            <div class="checkboxes">
                <?php foreach ($intereses_lista as $int): ?>
                    <label>
                        <input type="checkbox" name="temas[]" value="<?= $int['name'] ?>">
                        <?= $int['name'] ?>
                    </label>
                <?php endforeach; ?>
            </div>
        </div>

        <div class="grupo">
            <label>Observaciones</label>
            <textarea name="observaciones"></textarea>
        </div>

        <button type="submit" class="btn">Enviar</button>

    </form>
</div>

<footer>
    © <?= date("Y") ?> iTECH. All rights reserved.
</footer>

</body>
</html>
