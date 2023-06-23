import 'package:intl/intl.dart';

class NotesModel {
  final String title;
  final String content;
  final String category;
  final String catTitle;
  final DateTime dateTime;

  NotesModel({
    required this.title,
    required this.content,
    required this.category,
    required this.catTitle,
    required this.dateTime,
  });
  String getFormattedDateTime() {
    return DateFormat('yyyy-MM-dd hh:mm a').format(dateTime);
  }
}

List<NotesModel> note = [
  NotesModel(
    title: 'How to be Sucessfull ? ',
    content:
        '''Success in life is a subjective and multifaceted concept that can mean different things to different people. However, there are some general principles and strategies that can contribute to personal growth and achievement. Here are some tips that may help you on your journey towards success: 
        1. Set Clear Goals: Define what success means to you by setting clear, specific, and achievable goals. Having a clear vision of what you want to accomplish will give you direction and motivation.

        2. Develop a Growth Mindset: Cultivate a mindset that embraces challenges, sees failures as learning opportunities, and believes in the power of effort and continuous improvement. Embrace a positive attitude and believe in your ability to overcome obstacles.

        3. Take Action: Success requires taking consistent action towards your goals. Break your goals down into manageable steps and work on them consistently. Procrastination can hinder progress, so develop discipline and focus on taking action.

        4. Learn Continuously: Commit to lifelong learning and personal development. Acquire new knowledge, skills, and perspectives through books, courses, mentors, and experiences. Stay curious, open-minded, and adaptable in a rapidly changing world.

        5. Seek Mentorship and Role Models: Learn from those who have achieved success in areas that interest you. Seek out mentors, role models, or individuals who inspire you. Their guidance, advice, and insights can be invaluable on your journey.

        6. Network and Build Relationships: Surround yourself with positive and supportive individuals who share your values and aspirations. Network with people in your field of interest, attend events, and engage in communities where you can learn, collaborate, and grow.

        7. Embrace Failure and Resilience: Failure is often a stepping stone to success. Embrace setbacks as learning opportunities and use them to grow stronger and wiser. Develop resilience, bounce back from challenges, and persevere in the face of obstacles.

        8. Practice Self-Care: Take care of your physical, mental, and emotional well-being. Prioritize self-care activities such as exercise, healthy eating, sufficient sleep, and relaxation techniques. Maintaining balance and managing stress is essential for long-term success.

        9. Stay Persistent and Patient: Success rarely happens overnight. It takes time, effort, and perseverance. Stay committed to your goals, even when progress feels slow. Be patient with yourself and trust the process.

        10. Define Success on Your Own Terms: Remember that success is subjective and personal. Define what success means to you based on your values, passions, and aspirations. Avoid comparing yourself to others and focus on your own growth and progress.

        Ultimately, success is a lifelong journey, and the path may vary for each individual. Embrace the process, stay true to yourself, and continually strive to become the best version of yourself.''',
    category: 'Lifestyle',
    catTitle: 'Goal Setting ',
    dateTime: DateTime.now(),
  ),
  NotesModel(
    title: 'How Human Heart work?',
    content:
        '''The human heart is a vital organ responsible for pumping blood throughout the body. It is a complex muscular organ that consists of four chambers: two atria and two ventricles. Here's a simplified explanation of how the human heart works:

1. Blood enters the heart through the superior and inferior vena cava, which carry deoxygenated blood from the body into the right atrium.

2. The right atrium contracts, pushing the blood through the tricuspid valve into the right ventricle.

3. The right ventricle contracts, pumping the deoxygenated blood through the pulmonary valve into the pulmonary artery.

4. The pulmonary artery carries the blood to the lungs, where it picks up oxygen and releases carbon dioxide through the process of respiration.

5. Oxygenated blood returns from the lungs through the pulmonary veins, entering the left atrium.

6. The left atrium contracts, pushing the blood through the mitral valve into the left ventricle.

7. The left ventricle contracts, pumping the oxygenated blood through the aortic valve into the aorta, which is the largest artery in the body.

8. The aorta carries the oxygenated blood to various parts of the body, supplying oxygen and nutrients to the tissues.

9. The cycle repeats as deoxygenated blood returns to the right atrium and the process starts again.

To ensure one-way flow of blood, the heart has valves between the chambers and major blood vessels. The tricuspid valve separates the right atrium and right ventricle, while the mitral valve separates the left atrium and left ventricle. The pulmonary valve is located between the right ventricle and the pulmonary artery, and the aortic valve is between the left ventricle and the aorta.

The heart's contractions are regulated by electrical signals that initiate each heartbeat. The sinoatrial (SA) node, also known as the heart's natural pacemaker, generates an electrical impulse that spreads through the atria, causing them to contract. The signal then reaches the atrioventricular (AV) node, which sends the electrical impulse to the ventricles, causing them to contract and pump blood.

It's important to note that this is a simplified explanation of how the heart works. The cardiovascular system is complex, and there are many additional factors and processes involved, such as blood vessels, blood pressure regulation, and the coordination of the heart's electrical system.''',
    category: 'Biology',
    catTitle: 'Biology',
    dateTime: DateTime.now(),
  ),
];
