import amber/web/crypto_key.{type CryptoKey}
import amber/web/uint8_array.{type Uint8Array}

pub type DeriveAlgorithm {
  Name(String)
  Hkdf(hash: String, info: Uint8Array, salt: Uint8Array)
  Pbkdf2(hash: String, iterations: Int, salt: Uint8Array)
  Ecdh(public: CryptoKey)
}
