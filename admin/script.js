const ctx = document.getElementById('chartIngresos');

  new Chart(ctx, {
    type: 'line',
    data: {
      labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
      datasets: [{
        label: 'Ganancias por mes',
        data: [3000000, 2000000, 900000, 50000, 201021, 330343,304444,444440,604444,803334,903434,122112],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });

  const ctx1 = document.getElementById('chartCategoria');

  new Chart(ctx1, {
    type: 'pie',
    data: {
      labels: ['Amigurumis', 'Patrones', 'Tutoriales'],
      datasets: [{
        label: 'Productos por categorías',
        data: [20,30,25],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
  const ctx3 = document.getElementById('chartPorcentaje');

  new Chart(ctx3, {
    type: 'bar',
    data: {
      labels: ['Amigurumis', 'Patrones', 'Tutoriales'],
      datasets: [{
        label: 'Porcentaje de venta',
        data: [100,80,20],
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });