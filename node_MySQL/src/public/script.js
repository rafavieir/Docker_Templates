const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');

canvas.width = 800;
canvas.height = 400;

let isJumping = false;
let jumpHeight = 0;
let velocity = 0;
const gravity = 1;
const dino = { x: 50, y: 300, width: 50, height: 50 };
const cactus = { x: 800, y: 300, width: 50, height: 50 };

// Controlar o pulo
document.addEventListener('keydown', (e) => {
    if (e.code === 'Space' && !isJumping) {
        isJumping = true;
        velocity = -15;
    }
});

function update() {
    // Lógica de pulo
    if (isJumping) {
        dino.y += velocity;
        velocity += gravity;

        if (dino.y >= 300) {
            dino.y = 300;
            isJumping = false;
        }
    }

    // Movimentar o cacto
    cactus.x -= 5;
    if (cactus.x < -50) {
        cactus.x = canvas.width;
    }

    // Colisão
    if (
        dino.x < cactus.x + cactus.width &&
        dino.x + dino.width > cactus.x &&
        dino.y < cactus.y + cactus.height &&
        dino.y + dino.height > cactus.y
    ) {
        alert('Game Over!');
        cactus.x = canvas.width;
    }
}

function draw() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // Desenhar o dinossauro
    ctx.fillStyle = 'green';
    ctx.fillRect(dino.x, dino.y, dino.width, dino.height);

    // Desenhar o cacto
    ctx.fillStyle = 'red';
    ctx.fillRect(cactus.x, cactus.y, cactus.width, cactus.height);
}

function gameLoop() {
    update();
    draw();
    requestAnimationFrame(gameLoop);
}

gameLoop();
