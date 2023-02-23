from base64 import b64encode
from nacl import encoding, public

def encrypt(message:str, public_key:str) -> str:
    """Encrypts a message with a public key."""
    public_key = public.PublicKey(public_key.encode("utf-8"), encoding.Base64Encoder)
    sealed_box = public.SealedBox(public_key)
    encrypted = sealed_box.encrypt(message.encode("utf-8"))
    return b64encode(encrypted).decode("utf-8")

