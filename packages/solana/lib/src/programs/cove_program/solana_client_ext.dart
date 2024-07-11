import 'package:solana/solana.dart';
import 'package:solana/src/programs/cove_program/instruction.dart';

extension SolanaClientCoveProgram on SolanaClient {
  /// Register a new Boxhead to the specified account
  Future<void> registerProduct({
    required Ed25519HDPublicKey company_owner,
    required Ed25519HDPublicKey company,
    required Ed25519HDPublicKey collection_ref,
    required Ed25519HDPublicKey model,
    required Ed25519HDPublicKey product_mint,
    required Ed25519HDPublicKey from_account,
    required Ed25519HDPublicKey to_account,
    required Wallet product,
    required Ed25519HDPublicKey new_user,
    required Ed25519HDPublicKey nft_authority,
    SignatureCallback? onSigned,
    Commitment commitment = Commitment.finalized,
  }) async {
    final instruction = CoveInstruction.registerProduct(
      company_owner: company_owner,
      company: company,
      collection_ref: collection_ref,
      model: model,
      product_mint: product_mint,
      from_account: from_account,
      to_account: to_account,
      product: product.publicKey,
      new_user: new_user,
      nft_authority: nft_authority,
    );

    await sendAndConfirmTransaction(
      message: Message.only(instruction),
      signers: [product],
      onSigned: onSigned ?? ignoreOnSigned,
      commitment: commitment,
    );
  }
}
