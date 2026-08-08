function createUserPayload(prefix, overrides) {
  var stamp = Date.now();
  var payload = {
    nome: (prefix || 'qa') + ' Automation',
    email: (prefix || 'qa') + '-' + stamp + '@teste.com',
    password: 'Teste@123',
    administrador: 'true'
  };

  if (overrides) {
    Object.keys(overrides).forEach(function (key) {
      payload[key] = overrides[key];
    });
  }

  return payload;
}

function uniqueEmail(prefix) {
  return (prefix || 'qa') + '-' + Date.now() + '@teste.com';
}
