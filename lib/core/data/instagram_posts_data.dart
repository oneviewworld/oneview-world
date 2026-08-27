import '../models/instagram_post.dart';

final List<InstagramPost> instagramPosts = [
  InstagramPost(
    id: 'post_1',
    imageAsset: 'assets/instagram/Posts/Post 1.png',
    postUrl: 'https://www.instagram.com/p/Da063moCAYD/',
    caption: 'AI isn\'t the future. It\'s happening now.\n\n'
        'Businesses that embrace AI today will build faster, automate smarter, '
        'and create better digital experiences tomorrow.\n\n'
        'At OneView, we build intelligent software, mobile apps, games, and '
        'scalable cloud solutions that turn ideas into reality.',
    likes: 0,
    date: DateTime(2025, 12, 15),
  ),
  InstagramPost(
    id: 'post_2',
    imageAsset: 'assets/instagram/Posts/Post 2.jpg',
    postUrl: 'https://www.instagram.com/p/Da5bhEjC1ku/',
    caption: 'The future belongs to those who build it.\n\n'
        'At OneView, we create intelligent digital experiences that solve '
        'real-world problems through AI, mobile apps, web platforms, cloud '
        'solutions, and interactive technologies.',
    likes: 0,
    date: DateTime(2025, 12, 17),
  ),
  InstagramPost(
    id: 'post_3',
    imageAsset: 'assets/instagram/Posts/Post 3.1.png',
    allImages: [
      'assets/instagram/Posts/Post 3.1.png',
      'assets/instagram/Posts/Post 3.2.png',
    ],
    postUrl: 'https://www.instagram.com/p/DbLqeb6Exit/',
    caption: 'Every successful software project starts long before the first '
        'line of code is written.\n\n'
        'A clear plan helps you:\n'
        '✅ Define goals\n'
        '✅ Understand users\n'
        '✅ Choose the right architecture\n'
        '✅ Estimate time and resources\n'
        '✅ Reduce rework and bugs\n'
        '✅ Deliver better products',
    likes: 0,
    date: DateTime(2026, 1, 5),
  ),
  InstagramPost(
    id: 'post_4',
    imageAsset: 'assets/instagram/Posts/Post 4.1.png',
    allImages: [
      'assets/instagram/Posts/Post 4.1.png',
      'assets/instagram/Posts/Post 4.2.jpg',
      'assets/instagram/Posts/Post 4.3.jpg',
      'assets/instagram/Posts/Post 4.4.jpg',
      'assets/instagram/Posts/Post 4.5.jpg',
      'assets/instagram/Posts/Post 4.6.jpg',
      'assets/instagram/Posts/Post 4.7.jpg',
      'assets/instagram/Posts/Post 4.8.jpg',
      'assets/instagram/Posts/Post 4.9.jpg',
      'assets/instagram/Posts/Post 4.10.jpg',
      'assets/instagram/Posts/Post 4.11.jpg',
      'assets/instagram/Posts/Post 4.12.jpg',
      'assets/instagram/Posts/Post 4.13.PNG',
      'assets/instagram/Posts/Post 4.14.jpg',
    ],
    postUrl: 'https://www.instagram.com/p/DbSa0RhglUy/',
    caption: '12 UI Design Trends Every Designer Should Know in 2026 🎨✨\n\n'
        'UI design isn\'t about following trends. It\'s about choosing the right '
        'design language for the right product.\n\n'
        'Swipe through to explore 12 popular UI styles, when to use them, '
        'and where they work best.',
    likes: 0,
    date: DateTime(2026, 1, 10),
  ),
  InstagramPost(
    id: 'post_5',
    imageAsset: 'assets/instagram/Posts/Post 5.1.png',
    allImages: [
      'assets/instagram/Posts/Post 5.1.png',
      'assets/instagram/Posts/Post 5.2.png',
      'assets/instagram/Posts/Post 5.3.png',
      'assets/instagram/Posts/Post 5.4.png',
      'assets/instagram/Posts/Post 5.5.png',
      'assets/instagram/Posts/Post 5.6.png',
      'assets/instagram/Posts/Post 5.7.png',
      'assets/instagram/Posts/Post 5.8.png',
      'assets/instagram/Posts/Post 5.9.png',
      'assets/instagram/Posts/Post 5.10.png',
    ],
    postUrl: 'https://www.instagram.com/p/DbaGDifgme1/',
    caption: 'Launching a website isn\'t just about hitting Publish.\n\n'
        'A successful website is built on planning, performance, trust, and a '
        'great user experience. A practical checklist covering everything from '
        'startup mistakes and launch essentials to business websites, customer '
        'experience, automation, and the complete OneView development process.',
    likes: 0,
    date: DateTime(2026, 1, 15),
  ),
  InstagramPost(
    id: 'post_6',
    imageAsset: 'assets/instagram/Posts/Post 6.png',
    postUrl: 'https://www.instagram.com/p/DbyOEI5gsI8/',
    caption: '🧠 RAG isn\'t just a Vector Database + LLM.\n\n'
        'Retrieval-Augmented Generation (RAG) has become one of the most practical '
        'architectures for building AI applications that work with private, enterprise, '
        'and continuously changing information.\n\n'
        'A reliable RAG system is much more than connecting a vector database to a large '
        'language model. A production-ready RAG architecture involves multiple stages, '
        'from collecting and preparing data to retrieving relevant information, '
        'constructing context, generating responses, and continuously evaluating results.\n\n'
        'What Is Retrieval-Augmented Generation?\n\n'
        'RAG combines information retrieval with generative AI. Instead of relying only '
        'on what an LLM learned during training, a RAG application retrieves relevant '
        'information from an external knowledge source and provides that as context.\n\n'
        'User Query → Retrieve Relevant Information → Build Context → Generate Answer\n\n'
        '1. Data Ingestion: Start With the Right Data\n\n'
        'Information can come from PDFs, websites, databases, APIs, emails, knowledge '
        'bases, spreadsheets, and scanned documents. Data ingestion may involve document '
        'parsing, ETL, OCR, cleaning, normalization, and metadata extraction.\n\n'
        '2. Chunking: Break Information Into Useful Pieces\n\n'
        'Common strategies: fixed-size, semantic, and sliding-window chunking. The goal '
        'is chunks that preserve enough context to remain meaningful while being small '
        'enough to retrieve precisely.\n\n'
        '3. Embeddings: Convert Knowledge Into Searchable Representations\n\n'
        'An embedding model converts text into a numerical representation that captures '
        'semantic meaning, allowing the system to compare the meaning of a query with '
        'stored content.\n\n'
        '4. Vector Storage: Make Knowledge Retrievable\n\n'
        'Technologies include Pinecone, Weaviate, Qdrant, Milvus, Chroma, and FAISS. '
        'The vector database is one component — a strong RAG system depends on the '
        'entire retrieval pipeline.\n\n'
        '5. Query Processing: Understand What the User Is Asking\n\n'
        'May include query rewriting, expansion, spelling correction, intent detection, '
        'and metadata filtering to produce better retrieval results.\n\n'
        '6. Hybrid Search: Combine Semantic and Keyword Retrieval\n\n'
        'Semantic Vector Search + Keyword Search. Particularly useful for enterprise '
        'applications with technical terminology or domain-specific language.\n\n'
        '7. Retrieve the Most Relevant Context\n\n'
        'Top-K retrieval selects a smaller set of relevant information, improving '
        'efficiency and helping the model focus on what matters most.\n\n'
        '8. Re-Ranking: Improve Retrieval Relevance\n\n'
        'A re-ranking stage evaluates retrieved chunks again using cross-encoder or '
        'dedicated re-ranking models. Better retrieval → better context → better answers.\n\n'
        '9. Context Construction: Give the LLM the Right Information\n\n'
        'Involves combining relevant chunks, respecting token limits, removing noise, '
        'applying prompt templates, and organizing information logically.\n\n'
        '10. Generation: Let the LLM Respond\n\n'
        'The LLM uses the user\'s question together with retrieved context to generate '
        'a response grounded in the organization\'s available information.\n\n'
        '11. Citations and Sources: Make Answers Traceable\n\n'
        'Source transparency — document links, chunk references, metadata — makes '
        'AI-generated answers easier to review, validate, and trust.\n\n'
        '12. Guardrails and Safety\n\n'
        'Controls for PII, sensitive data, access permissions, content filtering, '
        'prompt injection, and policy enforcement. A connected knowledge base does not '
        'mean every user should access every piece of information.\n\n'
        '13. Memory, Caching and Observability\n\n'
        'Session memory maintains conversational context. Caching reduces repeated '
        'processing. Observability tracks retrieval relevance, answer quality, latency, '
        'hallucination rate, and user feedback.\n\n'
        '14. The Feedback Loop\n\n'
        'Retrieve → Generate → Evaluate → Learn → Improve\n\n'
        'Evaluation measures faithfulness, relevance, answer quality, retrieval accuracy, '
        'latency, and hallucination tendencies.\n\n'
        'Why RAG?\n\n'
        '• Reduced Hallucinations\n'
        '• Grounded Answers from your own knowledge sources\n'
        '• Up-to-Date Information without model retraining\n'
        '• Source Transparency with citations\n'
        '• Enterprise Flexibility across domains\n\n'
        'Where Can RAG Be Used?\n\n'
        'AI copilots, internal knowledge bases, customer support, intelligent search, '
        'document Q&A, technical support, research assistants, and enterprise workflow '
        'assistants.\n\n'
        'The Complete RAG Architecture\n\n'
        'Data Ingestion: Collect → Parse → Clean → Chunk → Embed → Store\n'
        'Retrieval: Query → Process → Search → Retrieve → Re-rank → Select Context\n'
        'Generation: Construct Context → Prompt → LLM → Generate Answer → Cite Sources\n\n'
        'RAG is more than a vector database connected to an LLM. It is an end-to-end '
        'architecture that combines data ingestion, intelligent retrieval, context '
        'construction, generation, evaluation, and continuous improvement.\n\n'
        'At OneView, we build modern AI-powered applications that solve real-world problems.\n\n'
        '🌐 oneview.world',
    likes: 0,
    date: DateTime(2026, 1, 20),
  ),
  InstagramPost(
    id: 'post_7',
    imageAsset: 'assets/instagram/Posts/Post 7.1.png',
    allImages: [
      'assets/instagram/Posts/Post 7.1.png',
      'assets/instagram/Posts/Post 7.2.png',
      'assets/instagram/Posts/Post 7.3.png',
      'assets/instagram/Posts/Post 7.4.png',
      'assets/instagram/Posts/Post 7.5.png',
      'assets/instagram/Posts/Post 7.6.png',
      'assets/instagram/Posts/Post 7.7.png',
      'assets/instagram/Posts/Post 7.8.png',
    ],
    postUrl: 'https://www.instagram.com/p/DcgN2fwguEH/',
    caption: '🏥 Care Doesn\'t End at Checkout\n\n'
        'The visit may be over, but the patient\'s care journey continues.\n\n'
        'Healthcare is a journey, not just a visit.\n\n'
        'A patient\'s experience with a clinic does not begin and end inside the '
        'consultation room. From the first appointment to patient records, '
        'consultation, prescriptions, investigations, billing, and follow-ups, '
        'every step contributes to the overall care journey.\n\n'
        'When these steps are disconnected, healthcare teams may spend '
        'unnecessary time managing information, tracking follow-ups, and '
        'coordinating what happens next.\n\n'
        'OneView connects the journey.\n\n'
        'Treatment Plans Keep Care Moving Forward\n\n'
        'After meeting with a doctor, a patient may need to follow a treatment '
        'plan, take prescribed medications, complete investigations, review '
        'reports, or return for another consultation.\n\n'
        'OneView helps keep these next steps connected to the patient record.\n\n'
        'Follow-ups Are Part of the Journey\n\n'
        'Follow-up appointments can be an important part of monitoring progress, '
        'reviewing results, updating treatment plans, or continuing a patient\'s care.\n\n'
        'OneView helps clinics organize upcoming follow-ups and connect them with '
        'the patient\'s previous visits and treatment history.\n\n'
        'Reminders Make the Next Step Clear\n\n'
        'OneView helps healthcare teams organize reminders, including:\n'
        '• Appointment reminders\n'
        '• Medication reminders\n'
        '• Investigation reminders\n'
        '• Report review reminders\n'
        '• Follow-up reminders\n\n'
        'From Consultation to Continued Care\n\n'
        'Consultation → Treatment Plan → Prescription → Investigation → Results → Follow-up → Continued Care\n\n'
        'Each step builds on the previous one.\n\n'
        'Better Continuity of Care\n\n'
        'Good healthcare is not only about what happens during a consultation. '
        'It is also about what happens afterward.\n\n'
        'OneView helps keep this information connected, giving healthcare teams '
        'a more organized way to manage ongoing patient care.\n\n'
        'One Platform. Complete Patient Care. Better Health.\n\n'
        'OneView connects appointments, patient records, consultations, '
        'prescriptions, investigations, billing, and follow-ups into one platform.\n\n'
        'Because every visit is part of something bigger.\n\n'
        'The consultation may end. The care continues.\n\n'
        '🌐 oneview.world',
    likes: 0,
    date: DateTime(2026, 8, 27),
  ),
];
