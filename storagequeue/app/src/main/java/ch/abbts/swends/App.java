/*
 * This Java source file was generated by the Gradle 'init' task.
 */
package ch.abbts.swends;

import java.time.Duration;

import com.azure.core.util.Context;
import com.azure.storage.queue.QueueClient;
import com.azure.storage.queue.QueueClientBuilder;
import com.azure.storage.queue.models.QueueMessageItem;
import com.azure.storage.queue.models.QueueStorageException;

public class App {
    final String queueName = "orakel-message-queue";
    final String connectionString = "Your connection string";

    public void addQueueMessage(String messageText) throws QueueStorageException {
        QueueClient queueClient = new QueueClientBuilder().connectionString(connectionString).queueName(queueName)
                .buildClient();
        System.out.println("Adding message to queue: " + messageText);
        queueClient.sendMessage(messageText);
    }

    public void dequeueMessages() throws QueueStorageException {
        QueueClient queueClient = new QueueClientBuilder().connectionString(connString).queueName(queueName)
                .buildClient();

        final int MAX_MESSAGES = 20;
        int numOfMessage = queueClient.getProperties().getApproximateMessagesCount();
        if (numOfMessage == 0) {
            System.out.println("No messages in queue - returning");
            return;
        } else if (numOfMessage > MAX_MESSAGES) {
            numOfMessage = MAX_MESSAGES;
        }

        System.out.println("Receiving " + numOfMessage + " messages");
        queueClient.receiveMessages(numOfMessage).forEach(message -> {
            System.out.println("Dequeing message: " + message.getBody().toString());
            queueClient.deleteMessage(message.getMessageId(), message.getPopReceipt());
        });
    }

    public void batchPutMessage(int number) {
        for (int i = 0; i < number; i++) {
            addQueueMessage("Message added to queue");
            try {
                Thread.sleep(2000);
            } catch (InterruptedException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }

    public String getGreeting() {
        return "Hello World!";
    }

    public static void main(String[] args) {
        App app = new App();
        try {
            //app.batchPutMessage(100);
            app.dequeueMessages();
        } catch (QueueStorageException e) {
            System.err.println(e.getMessage());
        }
    }
}
