const functions = require("firebase-functions");
const admin = require("firebase-admin");
const { createClient } = require("@supabase/supabase-js");

admin.initializeApp();

const db = admin.firestore();

// Configuração do Supabase
const supabaseUrl = functions.config().supabase.url;
const supabaseKey = functions.config().supabase.key;
const supabase = createClient(supabaseUrl, supabaseKey);

exports.deleteOldStories = functions.pubsub
  .schedule("every 24 hours")
  .onRun(async (context) => {
    const collectionName = "storys"; // Nome da coleção
    const now = admin.firestore.Timestamp.now();
    const cutoff = new Date(now.toDate().getTime() - 24 * 60 * 60 * 1000); // Subtrai 24 horas
    const query = db
      .collection(collectionName)
      .where("createdTime", "<=", cutoff);

    const snapshot = await query.get();
    const batch = db.batch();

    for (const doc of snapshot.docs) {
      const data = doc.data();

      try {
        // Deleta o arquivo no Supabase baseado na URL
        if (data.isImage) {
          // Campo imageUrl (se `isImage` for true)
          if (data.imageUrl && data.imageUrl.trim() !== "") {
            const filePath = data.imageUrl.split(
              "/storage/v1/object/public/",
            )[1]; // Extrai caminho relativo
            await supabase.storage.remove([filePath]);
          } else {
            console.log(`Campo imageUrl vazio para o documento: ${doc.id}`);
          }
        } else {
          // Campo videoUrl (se `isImage` for false)
          if (data.videoUrl && data.videoUrl.trim() !== "") {
            const filePath = data.videoUrl.split(
              "/storage/v1/object/public/",
            )[1]; // Extrai caminho relativo
            await supabase.storage.remove([filePath]);
          } else {
            console.log(`Campo videoUrl vazio para o documento: ${doc.id}`);
          }
        }
      } catch (error) {
        console.error(
          `Erro ao deletar arquivo do Supabase para o documento ${doc.id}: ${error.message}`,
        );
      }

      // Exclui o documento do Firestore
      batch.delete(doc.ref);
    }

    await batch.commit();
    return null;
  });
