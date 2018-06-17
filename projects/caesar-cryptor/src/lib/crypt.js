// Lib crypt

// helpers
const _A = 'A'.charCodeAt(0);
const _s = 256 + (' '.charCodeAt(0) - _A);

function textToByteArray(text) {
  let textArray = text.toUpperCase()
    .split('')
    .map(c => c.charCodeAt(0))
    .map(c => c - _A);

  return new Uint8Array(textArray);
}

function byteArrayToText(bytes) {
  bytes = bytes.map(b => b + _A);

  return String.fromCharCode(...bytes);
}

function fixKeyAndIv(key, iv) {
  key = parseInt(key);
  iv = parseInt(iv);

  key = key % 26;
  iv = iv & 0b11111;

  return [key, iv]
}

// caesar cipher
function caesar_enc(block, key) {
  return (block + key) % 26;
}

function caesar_dec(block, key) {
  return (block - key + 26) % 26;
}

// ecb
function caesar_ecb_enc(plain, key) {
  [key] = fixKeyAndIv(key);

  const plainBlocks = textToByteArray(plain);
  const cipherBlocks = plainBlocks.map(b => b == _s ? b : caesar_enc(b, key));

  return byteArrayToText(cipherBlocks);
}

function caesar_ecb_dec(cipher, key) {
  [key] = fixKeyAndIv(key);

  const cipherBlocks = textToByteArray(cipher);
  const plainBlocks = cipherBlocks.map(b => b == _s ? b : caesar_dec(b, key));

  return byteArrayToText(plainBlocks);
}

// cbc
function caesar_cbc_enc(plain, key, iv, fips) {
  [key, iv] = fixKeyAndIv(key, iv);
  const xmode = (a,b) => !!fips ? a ^ b : a + b;

  const plainBlocks = textToByteArray(plain);

  let lastEncBlock = iv;

  const cipherBlocks = plainBlocks.map(b => {
    if (b == _s) return b;

    const input = xmode(b, lastEncBlock);

    return lastEncBlock = caesar_enc(input, key);
  });

  return byteArrayToText(cipherBlocks);
}

function caesar_cbc_dec(cipher, key, iv, fips) {
  [key, iv] = fixKeyAndIv(key, iv);
  const xmode = (a,b) => !!fips ? a ^ b : a - b;

  const cipherBlocks = textToByteArray(cipher);

  let lastCBLock = iv;

  const plainBlocks = cipherBlocks.map(b => {
    if (b == _s) return b;

    const output = caesar_dec(b, key);
    const plain = (26 + xmode(output, lastCBLock)) % 26;

    lastCBLock = b;

    return plain;
  });

  return byteArrayToText(plainBlocks);
}

// export
export {
  caesar_ecb_enc,
  caesar_ecb_dec,
  caesar_cbc_enc,
  caesar_cbc_dec
}
